const voting = require("@vocdoni/voting")
const census = require("@vocdoni/census")
const dataModels = require("@vocdoni/data-models")
const signing = require("@vocdoni/signing")
const encryption = require("@vocdoni/encryption")
const common = require("@vocdoni/common")
const contractWrappers = require("@vocdoni/contract-wrappers")

window.getVocdoni = () => {
   return {
      ...voting,
      ...census,
      ...dataModels,
      ...signing,
      ...encryption,
      ...common,
      ...contractWrappers
   }
}
