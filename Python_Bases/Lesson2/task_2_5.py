# 5.  Создать вручную список, содержащий цены на товары (10–20 товаров), например:
#     [57.8, 46.51, 97, ...]

# A.    Вывести на экран эти цены через запятую в одну строку, цена должна отображаться в виде <r> руб <kk> коп
#       (например «5 руб 04 коп»). Подумать, как из цены получить рубли и копейки, как добавить нули, если, например,
#       получилось 7 копеек или 0 копеек (должно быть 07 коп или 00 коп).

price_list = [57.8, 46.51, 97, 13.56, 81, 93.12, 599.99, 825.28, 5.73, 25.41, 132, 0.48, 27.12, 2322.05, 750]
for item in price_list:
    print(str(int(item)) + ' руб ' + str("{0:.2f}".format(item))[-2:] + ' коп')

print("_________________________________________________________________________")

# B.    Вывести цены, отсортированные по возрастанию, новый список не создавать (доказать, что объект списка после
#       сортировки остался тот же).

print("id списка до сортировки: " + str(id(price_list)))
print("Список цен по возрастанию")
for item in sorted(price_list):
    print(str(int(item)) + ' руб ' + str("{0:.2f}".format(item))[-2:] + ' коп')
print("id списка после сортировки: " + str(id(price_list)))

print("_________________________________________________________________________")

# C.    Создать новый список, содержащий те же цены,
#       но отсортированные по убыванию.
print("Список цен отсортированный по убыванию")
new_price_list = sorted(price_list, reverse=True).copy()
print(new_price_list)

print("_________________________________________________________________________")

# D.    Вывести цены пяти самых дорогих товаров. Сможете ли вывести цены этих товаров по возрастанию, написав минимум
#       кода?
print("Список самых высоких цен")
print(sorted(new_price_list[:5]))
