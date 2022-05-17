# Статус
[![Ruby](https://github.com/infl4me/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/infl4me/rails-project-lvl1/actions/workflows/main.yml)
[![hexlet-check](https://github.com/infl4me/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/infl4me/rails-project-lvl1/actions/workflows/hexlet-check.yml)

# Генератор форм

Библиотека, с помощью которой удобно создавать формы в шаблонах сайтов. Позволяет сократить код описания формы во много раз за счет автоматической обработки ошибок и различных контролов

## Установка

`make setup`

## Использование

```
User = Struct.new(:id, :name, :job)

user = User.new

html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html
# Будет выведено:
# <form action="/users" method="post">
#   <label for="name">Name</label>
#   <input name="name" value="" type="text">
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job"></textarea>
#   <input type="submit" value="Create">
# </form>
```

