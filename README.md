# Разработка стенда АЛУ


С помощью Verilog HDL было разработано вычислительное устройство с микропрограммным управлением. 

Этапы создания: 

 * На первом этапе была разработана арифметико-логическая часть, обеспечивающая выполнение базовых операций, таких как сложение, вычитание, логические операции И, ИЛИ и др.

 * Затем был создан [регистровый арифметико-логический блок](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/RALU.v), который добавил возможность хранения промежуточных значений и управления вычислительным процессом.

 * После была реализована архитектура вычислительного устройства с микропрограммным управлением. В данном этапе была добавлена память, содержащая последовательности управляющих команд, разработано [устройство микропрограммного управления](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/UMU.v) с использованием естественной адресацией.

      Структура микрокоманды выглядит следующим образом: код перехода (условный/безусловный); управляющие сигналы для РАЛУ; адрес загрузки результата АЛУ в регистр; сигнал для входных данных, определяющий откуда загружается операнд ([РАЛУ/Внешнее устройство](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/RA.v)) 

    ![](https://github.com/user-attachments/assets/64433033-50ef-4a5b-9896-b439d4eed8ca)



 * Заключительным этапом стала отладка разработанного устройства на учебном стенде Terasic DE1 (на базе Altera Cyclone II EP2C20F484C7N). Для этого были интегрированы модули взаимодействия с утройствами [ввода](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/InputModule.v) и [вывода](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/OutputModule.v). В ходе отладки были разработаны и протестированы различные [сценарии работы](https://github.com/l1sok/ALU_BOARD/blob/main/%5BLABS%5D/mem.txt), проверены корректность выполнения команд и возможные ошибки. 


---
На основе проделанной работы аппаратно был разработан демонстрационный стенд АЛУ на базе дискретных компонентов на уровне транзисторов с интегрированной системой индикации.
Для ввода входных данных предусмотрены переключатели. Помимо светодиодов добавлены семисегментные индикаторы для лучшего восприятия информации школьниками.

При разработке эскиза макета АЛУ был разделён на три уровня: уровень [вентилей](https://github.com/l1sok/ALU_BOARD/tree/main/%5BGATE%5D); уровень [сумматоров](https://github.com/l1sok/ALU_BOARD/tree/main/%5BSM%5D) – связующий для вентилей; уровень [АЛУ](https://github.com/l1sok/ALU_BOARD/tree/main/%5BALU%5D) –  общий связующий уровень для сумматоров.


![image](https://github.com/l1sok/ALU_BOARD/blob/main/%5BGATE%5D/GATE_0.png)

![image](https://github.com/l1sok/ALU_BOARD/blob/main/%5BGATE%5D/GATE_1.png)


![image](https://github.com/l1sok/ALU_BOARD/blob/main/%5BSM%5D/SM_pic.png)


![image](https://github.com/l1sok/ALU_BOARD/blob/main/%5BALU%5D/ALU_pic.png)

---
_Для корректного отображения схем .SchDot необходимо установить шрифт [GOST_A](https://github.com/l1sok/MCU_PLD/blob/main/GOST_A%20.TTF)_
