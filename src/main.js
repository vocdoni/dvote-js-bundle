const voting = require("@vocdoni/voting")
const census = require("@vocdoni/census")

window.getVocdoni = () => {
   return {
      ...voting,
      ...census
   }
}
