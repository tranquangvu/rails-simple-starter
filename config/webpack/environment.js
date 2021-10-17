const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
const customConfig = require('./custom');

environment.plugins.append('Provide', new webpack.ProvidePlugin({}));
environment.config.merge(customConfig);

module.exports = environment;
