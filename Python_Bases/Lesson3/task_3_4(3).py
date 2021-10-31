# 3.	Написать функцию thesaurus(), принимающую в качестве аргументов имена сотрудников и возвращающую словарь,
# в котором ключи — первые буквы имён, а значения — списки, содержащие имена, начинающиеся с соответствующей буквы. \
# Например:
# >>> thesaurus("Иван", "Мария", "Петр", "Илья")
# {
#     "И": ["Иван", "Илья"],
#     "М": ["Мария"], "П": ["Петр"]
# }
# Подумайте: полезен ли будет вам оператор распаковки? Как поступить, если потребуется сортировка по ключам? Можно ли
# использовать словарь в этом случае?

# 4.	*(вместо задачи 3) Написать функцию thesaurus_adv(), принимающую в качестве аргументов строки в формате «Имя
# Фамилия» и возвращающую словарь, в котором ключи — первые буквы фамилий, а значения — словари, реализованные по схеме
# предыдущего задания и содержащие записи, в которых фамилия начинается с соответствующей буквы. Например:
# >>> thesaurus_adv("Иван Сергеев", "Инна Серова", "Петр Алексеев", "Илья Иванов", "Анна Савельева")
# {
#     "А": {
#         "П": ["Петр Алексеев"]
#     },
#     "С": {
#         "И": ["Иван Сергеев", "Инна Серова"],
#         "А": ["Анна Савельева"]
#     }
# }
# Как поступить, если потребуется сортировка по ключам?
def thesaurus_adv(*args):
    # создаем результирующий словарь
    thesaurus = {}
    # пробегаемся по списку состоящему из первых букв фамилий исходного списка, сразу же сортируем этот список.
    for surname_letter in sorted(set([name_surname.split()[1][0] for name_surname in args])):
        # для каждой определенной буквы фамилии создаем новый словарь
        thesaurus[surname_letter] = {}
        # создаем список имен для добавления к букве фамилии, фильтруя исходный
        names_to_put = list(filter(lambda name: name.split()[1].startswith(surname_letter), args))
        # пробегаемся по 1 буквам имен в отфильтрованном списке
        for name_letter in sorted(set([name_to_put.split()[0][0] for name_to_put in names_to_put])):
            # в итерации фильтруем список для вставки по текущей букве фамилии по первой букве имени и вставляем
            # в соотвествующий словарь ключ-значение, где значение отсортированный список имен.
            thesaurus[surname_letter][name_letter] = sorted(
                list(filter(lambda name: name.split()[0].startswith(name_letter), names_to_put)))
    return thesaurus


result = thesaurus_adv('Сергей Романов', 'Ксения Макарова', 'Анатолий Шишкин', 'Ярослав Ловцов', 'Сергей Волнухин',
                       'Роман Полевой', 'Владимир Плюснин', 'Сергей Плешаков', 'Сергей Демидов', 'Данил Паньков',
                       'Виктор Старых', 'Александр Мавлеткулов', 'Алексей Сторожев', 'Азер Агазаде', 'Кирилл Иванов',
                       'Владимир Синицын', 'Кирилл Замогильный', 'Дарья Штыркова', 'Aнна Пузакова', 'Александр Губарев',
                       'Евгений Демидов', 'Евгений Ямов', 'Михаил Красков', 'Юрий Бобылёв', 'Манько Евгений ',
                       'Марианна Трофимова', 'Тим Лукьянов', 'Алексей Лесняк', 'Екатерина Никитина',
                       'Ренат Нигматуллин', 'Станислав Герасимов', 'Николай Максимов', 'Юрий Бурмистров',
                       'Алмаз Гильмуллин', 'Алексей Ипполитов', 'Анна Гапоненко', 'Сергей Марин',
                       'Валерий Ибрагимов', 'Алмаз Гильмуллин', 'Леонид Перпер', 'Мирлан Эсентур', 'Ветышев Сергей',
                       'Елизавета Николаева', 'Сергей Уткин', 'Александр Камышенков', 'Светлана Морозова',
                       'Николай Лукин', 'Дмитрий Елисеев', 'Серафим Санин', 'Алексей Белкин', 'Арина Ковалева',
                       'Александр Суппес', 'Владислав Фарсиянц', 'Валера Пупкин', 'Моська Куськин')

print("Словарь:")
print(result)
print("__________________________________________________")
print("Вывод в читаемом виде:")

for surname_key in result.keys():
    print(surname_key)
    for name_key in result[surname_key].keys():
        print('\t', name_key)
        for name_and_surname in result[surname_key][name_key]:
            print('\t\t', name_and_surname)
