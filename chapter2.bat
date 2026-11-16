@echo off
chcp 65001 > nul
set correct=0
set points=0
set total=3

echo ==================================================
echo   МОДУЛЬ 2: ИНСПЕКЦИЯ КОДА (ПЛАГИНЫ И КОНФИГУРАЦИЯ)
echo ==================================================
echo.

echo Фрагмент 1 (Плагин автоформатирования текста для редактора):
echo 10: def format_document(buffer):
echo 11:     lines = buffer.split("\n")
echo 12:     cleaned = [line.strip() for line in lines]
echo 13:     return "\n".join(cleaned)
echo 14:     buffer.mark_saved()
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число
echo 2. Недостижимый код после return
echo 3. Неинициализированная переменная
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==3 (
    echo Неверно. Правильный ответ: 2. Строка 14 после return никогда не выполнится.
    set /a points-=5
) else if errorlevel==2 (
    echo Верно! Вызов buffer.mark_saved() после return является недостижимым кодом.
    set /a correct+=1
    set /a points+=10
) else (
    echo Неверно. Правильный ответ: 2. Строка 14 после return никогда не выполнится.
    set /a points-=5
)
echo.

echo Фрагмент 2 (Проверка размера открываемого файла в плагине):
echo 20: def check_file_limit(file_size_bytes):
echo 21:     if file_size_bytes ^> 52428800:
echo 22:         return False
echo 23:     return True
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число (52428800 без именованной константы)
echo 2. Утечка ресурса
echo 3. Мёртвое присваивание
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==2 (
    echo Неверно. Правильный ответ: 1. Число 52428800 следует вынести в константу MAX_FILE_SIZE.
    set /a points-=5
) else if errorlevel==1 (
    echo Верно! Магическое число 52428800 (50 МБ) затрудняет чтение и поддержку кода.
    set /a correct+=1
    set /a points+=10
) else (
    echo Неверно. Правильный ответ: 1. Число 52428800 следует вынести в константу MAX_FILE_SIZE.
    set /a points-=5
)
echo.

echo Фрагмент 3 (Чтение JSON-конфигурации горячих клавиш редактора):
echo 30: def load_keybindings(config_path):
echo 31:     file = open(config_path, "r", encoding="utf-8")
echo 32:     data = json.load(file)
echo 33:     return data
echo.
echo Какой дефект здесь скрыт?
echo 1. Мёртвое присваивание
echo 2. Неинициализированная переменная
echo 3. Утечка ресурса и отсутствие обработки ошибок (файл не закрывается, нет try/except)
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==3 (
    echo Верно! Файл открыт без менеджера контекста with и без обработки ошибок чтения.
    set /a correct+=1
    set /a points+=10
) else (
    echo Неверно. Правильный ответ: 3. Файл не закрывается (утечка дескриптора) и нет try/except.
    set /a points-=5
)
echo.

echo === Итоговый отчёт ревьюера ===
echo Просмотрено фрагментов: %total%
echo Правильных ответов:     %correct% из %total%
echo Набрано баллов:         %points%
set /a percentage=correct*100/total
echo Точность ревью:        %percentage%%%

set reviewer_level=Junior Reviewer
if %percentage% geq 80 (
    set reviewer_level=Senior Reviewer
) else if %percentage% geq 50 (
    set reviewer_level=Middle Reviewer
)
echo Уровень ревьюера:      %reviewer_level%
echo.
pause
