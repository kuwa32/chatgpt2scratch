#!/bin/sh

LF=$(printf '\\\012_')
LF=${LF%_}
EXTENSION_NAME=ChatGPT2Scratch
EXTENSION_ID=chatgpt2scratch
COLLABORATOR=ichiroc
EXTENSION_DESCRIPTION="ChatGPT for Scratch"

sed -i -e "s/process.env.AZURE_API_KEY/\"${AZURE_API_KEY}\"/g" ${EXTENSION_ID}/scratch-vm/src/extensions/scratch3_${EXTENSION_ID}/index.js
sed -i -e "s/process.env.DOJO_KEY/\"${DOJO_KEY}\"/g" ${EXTENSION_ID}/scratch-vm/src/extensions/scratch3_${EXTENSION_ID}/index.js

mkdir -p node_modules/scratch-vm/src/extensions/scratch3_${EXTENSION_ID}
cp ${EXTENSION_ID}/scratch-vm/src/extensions/scratch3_${EXTENSION_ID}/index.js node_modules/scratch-vm/src/extensions/scratch3_${EXTENSION_ID}/
mv node_modules/scratch-vm/src/extension-support/extension-manager.js node_modules/scratch-vm/src/extension-support/extension-manager.js_orig
sed -e "s|class ExtensionManager {$|builtinExtensions['${EXTENSION_ID}'] = () => require('../extensions/scratch3_${EXTENSION_ID}');${LF}${LF}class ExtensionManager {|g" node_modules/scratch-vm/src/extension-support/extension-manager.js_orig > node_modules/scratch-vm/src/extension-support/extension-manager.js

mkdir -p src/lib/libraries/extensions/${EXTENSION_ID}
cp ${EXTENSION_ID}/scratch-gui/src/lib/libraries/extensions/${EXTENSION_ID}/${EXTENSION_ID}.png src/lib/libraries/extensions/${EXTENSION_ID}/
cp ${EXTENSION_ID}/scratch-gui/src/lib/libraries/extensions/${EXTENSION_ID}/${EXTENSION_ID}-small.png src/lib/libraries/extensions/${EXTENSION_ID}/
mv src/lib/libraries/extensions/index.jsx src/lib/libraries/extensions/index.jsx_orig
DESCRIPTION="\
    {${LF}\
        name: '${EXTENSION_NAME}',${LF}\
        extensionId: '${EXTENSION_ID}',${LF}\
        collaborator: '${COLLABORATOR}',${LF}\
        iconURL: ${EXTENSION_ID}IconURL,${LF}\
        insetIconURL: ${EXTENSION_ID}InsetIconURL,${LF}\
        description: (${LF}\
            <FormattedMessage${LF}\
                defaultMessage='${EXTENSION_DESCRIPTION}'${LF}\
                description='${EXTENSION_DESCRIPTION}'${LF}\
                id='gui.extension.${EXTENSION_ID}blocks.description'${LF}\
            />${LF}\
        ),${LF}\
        featured: true,${LF}\
        disabled: false,${LF}\
        internetConnectionRequired: true,${LF}\
        bluetoothRequired: false${LF}\
    },"
sed -e "s|^export default \[$|import ${EXTENSION_ID}IconURL from './${EXTENSION_ID}/${EXTENSION_ID}.png';${LF}import ${EXTENSION_ID}InsetIconURL from './${EXTENSION_ID}/${EXTENSION_ID}-small.png';${LF}${LF}export default [${LF}${DESCRIPTION}|g" src/lib/libraries/extensions/index.jsx_orig > src/lib/libraries/extensions/index.jsx
