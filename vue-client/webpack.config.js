
const path = require('path')
const webpack = require('webpack')

module.exports = {
    entry:[
        'webpack/hot/dev-server',
        'webpack-dev-server/client?http://localhost:8080',
        './index.js'
    ],
    output:{
        path:path.resolve(__dirname,'dist'),
        filename:'index.bundle.js'
    },
    resolve: {
        extensions: ['', '.js', '.vue','.css']
    },
    babel:{
        presets:['es2015','stage-2'],
        plugins: [["component", [
            {
                "libraryName": "element-ui",
                "styleLibraryName": "theme-default"
            }
        ]]]
    },
    module:{
        loaders:[
            {
                test:/\.js$/,exclude:/node_modules/,loader:'babel'
            },
            {
                test:/\.vue$/,exclude:/node_modules/,loader:'vue'
            },
            {   
                test: /\.css$/,loader: 'style-loader!css-loader'
            },
            {
                test: /\.(eot|svg|ttf|woff|woff2)(\?\S*)?$/,loader: 'file-loader'
            },
            {
                test: /\.(png|jpe?g|gif|svg)(\?\S*)?$/,loader: 'file-loader',
                query: {
                    name: '[name].[ext]?[hash]'
                }
            }
        ]
    }
}