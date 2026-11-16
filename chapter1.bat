@echo off
chcp 65001 > nul
set score_sublime=0
set score_atom=0
set score_notepadpp=0

echo ==================================================
echo   МОДУЛЬ 1: ВЫБОР ТЕКСТОВОГО РЕДАКТОРА ДЛЯ КОМАНДЫ
echo ==================================================
echo.

echo Вопрос 1: Какой бюджет выделен на покупку лицензий для 8 разработчиков?
echo 1. Бюджет 0 рублей (нужно полностью бесплатное Open-Source решение)
echo 2. Ограниченный бюджет (возможна покупка 1-2 лицензий, остальные на бесплатной версии)
echo 3. Бюджет позволяет купить коммерческие лицензии на всю команду
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==3 set /a score_sublime+=15
if errorlevel==2 set /a score_notepadpp+=10
if errorlevel==1 (
    set /a score_notepadpp+=15
    set /a score_atom+=15
)
echo.

echo Вопрос 2: Насколько критична скорость запуска и работа с большими файлами логов (более 500 МБ)?
echo 1. Критически важна максимальная скорость и минимальное потребление ОЗУ
echo 2. Важна высокая скорость работы и отзывчивый интерфейс на больших проектах
echo 3. Работаем с небольшими файлами, важнее визуальная кастомизация (Electron)
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==3 set /a score_atom+=15
if errorlevel==2 set /a score_sublime+=15
if errorlevel==1 set /a score_notepadpp+=15
echo.

echo Вопрос 3: Какие требования к экосистеме плагинов и кроссплатформенности в команде?
echo 1. Все работают на Windows, нужны базовые плагины (сравнение файлов, автодополнение)
echo 2. Нужна мощная экосистема пакетного менеджера (Package Control) и мультикурсор
echo 3. Нужна глубокая интеграция с GitHub и гибкая настройка интерфейса на JS/CSS
choice /c 123 /n /m "Ваш выбор (1-3): "
if errorlevel==3 set /a score_atom+=15
if errorlevel==2 set /a score_sublime+=15
if errorlevel==1 set /a score_notepadpp+=15
echo.

echo --- Результаты оценки профиля команды ---
echo Sublime Text: %score_sublime% баллов
echo Atom:         %score_atom% баллов
echo Notepad++:    %score_notepadpp% баллов
echo.

set rec_tech=Notepad++
if %score_sublime% geq %score_atom% if %score_sublime% geq %score_notepadpp% set rec_tech=Sublime Text
if %score_atom% gtr %score_sublime% if %score_atom% geq %score_notepadpp% set rec_tech=Atom

echo Рекомендуемый текстовый редактор: %rec_tech%
echo.
pause
