---
name: create-topic
description: Use a topic template file and copy it to a given path.
---

# Instructions
1. If a topic type is not given. derive its type from:
  * the specified path, such as a 'task' for '../tasks/ai-factory-deployment-airgapped-ollama.adoc'
  * the topic's content
1. Identify a corresponding template in the `<WORKSPACE_ROOT>/templates/` directory.
1. Copy the template's content to the subdirectory for the specific topic type in `<WORKSPACE_ROOT>`.
   Name the target file to express its content, such as 'tasks/ai-factory-deployment-airgapped-ollama.adoc'.
1. Sanitize the new content using instructions from the 'sanitize' skill.
1. Include the new topic file from the corresponding article file.