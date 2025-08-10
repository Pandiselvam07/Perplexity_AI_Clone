from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np
class SortSourceService:
  def __init__(self):
    self.embadding_model=SentenceTransformer("all-MiniLM-L6-v2") 

  def sort_source(self,query:str,search_results:List[dict]):
    relavant_docs=[]
    query_embadding = self.embadding_model.encode(query)

    for result in search_results:
       
       content = result.get('content')
       if not content or not content.strip(): 
                continue
       res_embadding = self.embadding_model.encode(result.get('content'))
    
       similarity =float(np.dot(query_embadding,res_embadding/
                        (np.linalg.norm(query_embadding)*np.linalg.norm(res_embadding))))
      
       result['relavance_score'] = similarity
      
       if similarity > 0.5:
         relavant_docs.append(result)

    sorted_docs =sorted(relavant_docs,key=lambda x:x['relavance_score'],reverse=True)
    return sorted_docs

