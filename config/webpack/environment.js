const { environment } = require("@rails/webpacker")

const webpack = require("webpack")
enviroment.plugins.prepend("Provide",
  new Webpack.ProvidePlugin({
    $: "jquery/src/jquery"
  })
)

module.exports = environment
