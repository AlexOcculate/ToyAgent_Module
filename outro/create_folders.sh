#!/bin/bash

# chmod +x create_folders.sh

# git submodule add https://github.com/AlexOcculate/ToyAgentNoBrain
# git submodule deinit -f ToyAgentNoBrain
# git rm -f ToyAgentNoBrain
# rm -rf .git/modules/ToyAgentNoBrain
#
SM=ToyAgentNoBrain
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyA2A
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyMCP
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyBrain
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyPlanner
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyEmbeddings
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyVectorDB
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyRAG
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToySandBox
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyEvaluator
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
SM=ToyCapstone
SMP="SubModules/${SM}"
git submodule add https://github.com/AlexOcculate/${SM} ${SMP}
#
git submodule update --remote --recursive
