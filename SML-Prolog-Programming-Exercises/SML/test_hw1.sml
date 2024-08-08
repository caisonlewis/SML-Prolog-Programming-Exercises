val _ = use "testing.sml";
val _ = use "sml_hw1.sml";

val _ = print("**************TEST RESULTS******************\n");

val _ = test("1.1","pow",pow,(2,3),8);
val _ = test("1.2","pow",pow,(2,5),32);
val _ = test("1.3","pow",pow,(~2,4),16);
val _ = test("1.4","pow",pow,(2,4),16);

val _ = test_real("2.1", "sumTo", sumTo, 3, 1.83333);
val _ = test_real("2.2", "sumTo", sumTo, 2, 1.5);
val _ = test_real("2.3", "sumTo", sumTo, 4, 2.0833);
val _ = test_real("2.4", "sumTo", sumTo, 0, 0.0);

val _ = test("3.1", "repeat", repeat,("hello", 3), "hellohellohello");
val _ = test("3.2", "repeat", repeat,("hello", 1), "hello");
val _ = test("3.3", "repeat", repeat,("hello", 0), "");

val _ = test("4.1","binary",binary, 17, "0000000000010001");
val _ = test("4.2","binary",binary, 1023, "0000001111111111");
val _ = test("4.3","binary",binary, 62345, "1111001110001001");

val _ = test("5.1", "countNegative", countNegative, [3,17,~9,34,~7,2],2);
val _ = test("5.2", "countNegative", countNegative, [3,17,9,34,7,2],0)
val _ = test("5.3", "countNegative", countNegative, [], 0);

val _ = test("6.1", "absList", absList, [(~38,47), (983,~14), (~17,~92), (0,34)], [(38,47),(983,14), (17,92), (0,34)]);
val _ = test("6.2", "absList", absList, [(~38,~47), (~983,~14)], [(38,47),(983,14)]);

val _ = test("7.1","split",split,[5,6,8,17,93,0],[(2,3), (3,3), (4,4), (8,9), (46,47), (0,0)]);
val _ = test("7.2", "split", split,[5,1,8,17,93,0],[(2,3), (0,1), (4,4), (8,9), (46,47), (0,0)]);

val _ = test("8.1", "isSorted", isSorted, [1,2,3,4,4,5,5], true);
val _ = test("8.2", "isSorted", isSorted, [1,2,3,4,3,5,5], false);
val _ = test("8.3", "isSorted", isSorted, [1], true);
val _ = test("8.4", "isSorted", isSorted, [], true);
val _ = test("8.5", "isSorted", isSorted, [1,1,1,1,1], true);

val _ = test("9.1", "collapse",collapse,[1,3,5,19,7,4],[4,24,11]);
val _ = test("9.2", "collapse",collapse,[1,2,3,4,5],[3,7,5]);
val _ = test("9.3", "collapse",collapse,[1,2],[3]); 
val _ = test("9.4", "collapse",collapse,[1],[1]);

val _ = test("10.1","insert",insert,(8,[1,3,7,9,22,38]), [1,3,7,8,9,22,38]);
val _ = test("10.2","insert",insert,(88,[1,3,7,9,22,38]), [1,3,7,9,22,38,88]);
val _ = test("10.3","insert",insert,(0,[1,3,7,9,22,38]), [0,1,3,7,9,22,38]);
val _ = test("10.4","insert",insert,(22,[1,3,7,9,22,38]), [1,3,7,9,22,22,38]);

val _ = test("11.1", "decimal", decimal, "0000000000010001", 17);
val _ = test("11.2", "decimal", decimal, "0000001111111111", 1023);
val _ = test("11.3", "decimal", decimal, "1111001110001001", 62345);