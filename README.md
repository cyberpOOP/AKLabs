# Лаба 2.
## Відкриваєм перший термінал у папці з файлами і прописуємо:
1. PATH=$PATH:~/opt/xPacks/qemu-arm/***2.8.0-7***/bin/ (має бути так, там в 1 лабі треба скачати конкретно таку верію або просто під себе переписати)
2. make (білдить зміни у файлі Lab1.S)
3. make qemu (запускає емулятор)
## Відкриваєм други термінал і пишем:
1. gdb-multiarch firmware.elf
2. target extended-remote:1234

## Результат як на скрінах. Два термінала залишаються паралельно працювати
### Успішний make & make qemu
<img src="/res/make.jpg">

### Успішний gbdarch там шось

<img src="/res/target.jpg">

### Щоб виконувати програму пишете S і потім тикаєте ентер, воно буде виконувати код по кроку

<img src="/res/tea.jpg">

### Кінець виконання програми і результати через команду "i r". Іноді просить прописати іншу команду, просто пишете, якшо не поняли як її писати - перепитуєте