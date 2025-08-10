import google.generativeai as genai
from config import Settings


settings=Settings()

class LLMService:

  def __init__(self):

    genai.configure(api_key=settings.GEMINI_API_KEY)
    self.model = genai.GenerativeModel("gemini-2.5-pro")

  def generate_response(self, query:str, search_results:list[dict]):
    context_text = "\n\n".join([
      f"Source {i+1} {results['url']}:\n {results['content']}"
      for i , results in enumerate(search_results)
      ])
    full_prompt = f"""
    You are an advanced AI assistant. Your task is to answer the user's query using the provided web search results.

    Context from web search (multiple sources):
    {context_text}

    User Query:
    {query}
    
    Guidelines for your answer:
    1. Summarize the most important and relevant points from the sources.
    2. Integrate information from multiple sources for a complete picture.
    3. Use a clear, neutral, and informative tone.
    4. If some parts of the query cannot be answered from the context, explicitly state this rather than guessing.
    5. Avoid redundancy — merge similar points from different sources.
    6. If appropriate, include bullet points, tables, or short summaries for better clarity.

    Note : Do not not use your own knowlege until it absolutely neccessary.

    Now, provide a **comprehensive, well-structured, thinl deeply , ensures it answers the user query and factually accurate** answer:
    """
    response =self.model.generate_content(full_prompt,stream=True)
    for chunk in response:
      yield chunk.text
    
