# Watcher

## なにこれ

- `--path` で指定したディレクトリを監視する [mruby-cli](https://github.com/hone/mruby-cli) で作ったワンバイナリツールの試作品
- クロスコンパイル環境があれば Linux から Windows や MacOS X 用も用意することが出来る

## 参考

- https://github.com/hone/mruby-cli
- https://github.com/matsumoto-r/pfds
- https://github.com/harasou/gfmarkdown
- https://github.com/FlavourSys/mruby-inotify
- https://github.com/mttech/mruby-getopts

## ビルド

### build_config.rb の修正

- 必要に応じて build_config.rb を修正する
- クロスコンパイル用の設定が書かれている

### rake

```sh
rake
```

### Docker 環境があれば...

```sh
docker-compose run compile
```

## 使い方

### ヘルプ

```sh
$ watcher --help
```

### 起動

```sh
$ watcher --path /tmp/
[Sat Feb 06 17:15:27 2016] DEBUG : Watch starting...
```
