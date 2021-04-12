const path = require('path');
const merge = require('webpack-merge');
const common = require('./webpack.common.js');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

const outputPath = path.join(__dirname, 'build/web');

module.exports = merge(common ,{
    mode: 'production',
    entry: path.join(__dirname, 'static/index.js'),
    output: {
        path: outputPath,
        filename: 'index.js'
    },
    module: {
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            use: [{
                loader: 'elm-webpack-loader',
                options: {
                    verbose: false,
                    debug: false,
                    cwd: __dirname
                }
            }]
        },
        {
            test: /\.s[ac]ss$/,
            use: [
                'style-loader',
                'css-loader',
                'sass-loader'
            ]
        }]
    },
    optimization: {
        minimizer: [
            new UglifyJsPlugin({
                uglifyOptions: {
                    minimize:true,
                    compress: {
                        pure_funcs: ['F2','F3','F4','F5','F6','F7','F8','F9','A2','A3','A4','A5','A6','A7','A8','A9'],
                        pure_getters: true,
                        keep_fargs: false,
                        unsafe_comps: true,
                        unsafe: true,
                        passes: 3
                    },
                    mangle:true
                }
            })
        ]
    }
});