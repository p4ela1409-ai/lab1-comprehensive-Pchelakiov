@echo off
chcp 65001 > nul

:weights
echo ==================================================
echo   МОДУЛЬ 3: СРАВНИТЕЛЬНЫЙ АНАЛИЗ ТЕКСТОВЫХ РЕДАКТОРОВ
echo ==================================================
echo.
echo Назначьте веса критериям для команды из 8 человек (сумма должна быть равна 100):
set /p w1="Вес критерия 1 (Скорость работы и низкое потребление ОЗУ): "
set /p w2="Вес критерия 2 (Наличие плагинов и гибкость настройки): "
set /p w3="Вес критерия 3 (Стоимость лицензии при ограниченном бюджете): "

set /a total_weight=w1+w2+w3
if %total_weight% neq 100 (
    echo.
    echo [Ошибка] Сумма весов равна %total_weight%, а должна быть 100! Попробуйте снова.
    echo.
    goto weights
)

echo.
echo Оцените каждый текстовый редактор по шкале от 1 до 5:
echo --- Sublime Text ---
set /p st_1="Sublime Text - Скорость работы (1-5): "
set /p st_2="Sublime Text - Наличие плагинов (1-5): "
set /p st_3="Sublime Text - Стоимость лицензии (1-5): "

echo --- Atom ---
set /p at_1="Atom - Скорость работы (1-5): "
set /p at_2="Atom - Наличие плагинов (1-5): "
set /p at_3="Atom - Стоимость лицензии (1-5): "

echo --- Notepad++ ---
set /p np_1="Notepad++ - Скорость работы (1-5): "
set /p np_2="Notepad++ - Наличие плагинов (1-5): "
set /p np_3="Notepad++ - Стоимость лицензии (1-5): "

set /a score_st=st_1*w1+st_2*w2+st_3*w3
set /a score_at=at_1*w1+at_2*w2+at_3*w3
set /a score_np=np_1*w1+np_2*w2+np_3*w3

echo.
echo ===================== МАТРИЦА РЕШЕНИЙ (WSM) =====================
echo Критерий                 ^| Вес ^| Sublime Text ^|   Atom   ^| Notepad++
echo -----------------------------------------------------------------
echo Скорость работы          ^| %w1%  ^|      %st_1%       ^|    %at_1%     ^|     %np_1%
echo Наличие плагинов         ^| %w2%  ^|      %st_2%       ^|    %at_2%     ^|     %np_2%
echo Стоимость лицензии       ^| %w3%  ^|      %st_3%       ^|    %at_3%     ^|     %np_3%
echo -----------------------------------------------------------------
echo ИТОГОВЫЙ БАЛЛ            ^| 100 ^|     %score_st%      ^|   %score_at%    ^|    %score_np%
echo =================================================================
echo.

set wsm_winner=Notepad++
if %score_st% geq %score_at% if %score_st% geq %score_np% set wsm_winner=Sublime Text
if %score_at% gtr %score_st% if %score_at% geq %score_np% set wsm_winner=Atom

echo Победитель сравнительного анализа: %wsm_winner%
echo.
pause
