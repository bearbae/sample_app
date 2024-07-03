const path = require('path');

module.exports = {
  entry: './app/javascript/application.js', // Đường dẫn tới file entry point của ứng dụng
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'packs') // Thư mục để lưu trữ các file bundle
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader', // Sử dụng babel-loader để biên dịch JavaScript ES6+
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'] // Sử dụng style-loader và css-loader cho các file CSS
      }
    ]
  }
};
