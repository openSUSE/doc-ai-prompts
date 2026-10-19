---
name: create-topic
description: Use a topic template file and copy it to a given path.
---

# Instructions
1. If a topic type - such as 'task' or 'concept' is not given, derive it from the specified path,
   such as a 'task' for '../tasks/ai-factory-deployment-airgapped-ollama.adoc'
2. Identify a corresponding template in the 'templates/<TOPIC_NAME>s' directory.
3. Copy the template's content to the topic-type directory in the workspace root,
   following the file name from the specified path, such as 'tasks/ai-factory-deployment-airgapped-ollama.adoc'.