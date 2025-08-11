import asyncio
from fastapi import FastAPI, WebSocket
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService
from services.LLM_service import LLMService


app =FastAPI()
search_service=SearchService()
sort_source_service=SortSourceService()
llm_service=LLMService()


@app.websocket("/ws/chat")
async def web_socket(webSocket:WebSocket):
  await webSocket.accept()
  try:
    await asyncio.sleep(0.1)
    data=await webSocket.receive_json()
    query=data.get("query")
    search_results = search_service.web_search(query)
    sorted_source_results = sort_source_service.sort_source(query,search_results)
    await webSocket.send_json({"type":"search_results","data":sorted_source_results})
    for chunk in llm_service.generate_response(query,sorted_source_results):
      await asyncio.sleep(0.1)
      await webSocket.send_json({"type":"content","data":chunk})
    
  except:
    print('Unexcepted error occured')
  finally:
    await webSocket.close()


@app.post("/chat")
def chat_endpoint(body:ChatBody):
  search_results = search_service.web_search(body.query)
  sorted_source_results = sort_source_service.sort_source(body.query,search_results)
  llm_results=llm_service.generate_response(body.query,sorted_source_results)
  return llm_results 