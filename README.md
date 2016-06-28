# checkOddWords

## Last project in Reconfigurable Computing

### Hardaware + IDE 

* Nexys4™ FPGA Xilinx Board ([Manual](http://www.xilinx.com/support/documentation/university/XUP%20Boards/XUPNexys4/documenatation/Nexys4_RM_VB1_Final_3.pdf))
![alt tag](https://reference.digilentinc.com/_media/nexys/nexys4/nexys4-obl-600_1_.png)

* Vivado + SDK (optimized 2015.4) ([Download](http://www.xilinx.com/support/download.html))


---

### Task

Use general structure (following figure)

![alt tag](https://github.com/ruipoliveira/checkOddWords/blob/master/resources/Screenshot%202016-06-11%2020.36.27.png)

You have to include the following two tasks:

a) Hardware with data stored in ROM and check results using switches, buttons and displays.

b) Hardware connection with software developed for MicroBlaze processor

* Input data: 16 words / 16 bit 

* Processing: find all the odd words

* Output data: LEDs(16 bit): sequentially show the words found in binary with a frequency of approximately 1 Hz

* Use software to input initial data .

---
### Solutions
Hardware solution ([hardwareVersion](https://github.com/ruipoliveira/checkOddWords/tree/master/hardwareVersion))
![alt tag](https://github.com/ruipoliveira/checkOddWords/blob/master/resources/hardVersion.png)

Software solution ([SoftVersion](https://github.com/ruipoliveira/checkOddWords/tree/master/SoftVersion))
![alt tag](https://github.com/ruipoliveira/checkOddWords/blob/master/resources/softVersion.png)

---
### Result/Execution


---
### Authors

* Rui Oliveira (ruipedrooliveira@ua.pt)
