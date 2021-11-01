# nmt-ansible-03

# Подготовительный этап.
В целях закрепления материала было решено подготавливать инфраструктуру не вручную, а используя terraform. Что было сделано:
* использован провайдер yandex-cloud/yandex версии 0.65.0
* создано отдельное облако для задания
* создан сервисный пользователь 
* создан отдельный бакет для сохранения состояний terraform
* сгенерированы ключи доступа, токены, выданы необходимые права
* из соображений безопасности использованы файлы ключей, пути к ним передаются через переменные окружения, в приложенных файлвх конфигурации эти параметры отсутствуют.

Конфигурационные файлы terraform находятся в каталоге /terraform данного репозитория

TODO: автоматизировать генерацию ansible inventory с помощью шаблонизатора terraform / написать модуль к teraform  передавать инвентарь ansile json / использовать teamcity

В отличии от материала лекции, было интересно попробовать модули systemd и apt, по-этому работа выполнялась на образе Ubuntu 20.04

# Основная часть

Данный плейбук позволяет выполнить установку и конфигурацию связки elasticsearch, kibana и filebeats, а так же любые из компонентов по-отдельности.
Для установки отдельных компонентов используйте тэги: elasticsearch, kibana, filebeats