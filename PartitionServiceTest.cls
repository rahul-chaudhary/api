@IsTest
private class PartitionServiceTest {
    
    static final Integer MAX_COLLECTION_SIZE = 1000;

    @IsTest
    static void testDoPartition1() {
        List<Integer> input = new List<Integer>();
		Test.startTest();
        for(Integer i=0; i<10500;i++) {
            input.add(i);
        }
        List<List<Integer>> output = (List<List<Integer>>) PartitionService.doPartions(input, MAX_COLLECTION_SIZE, List<List<Integer>>.class);
		Test.stopTest();
        System.assert(output!=null && output.size()==11);
    }

    @IsTest
    static void testDoPartition2() {
        List<Integer> input = new List<Integer>();
        for(Integer i=0; i<10000;i++) {
            input.add(i);
        }
		Test.startTest();
        List<List<Integer>> output = (List<List<Integer>>) PartitionService.doPartions(input, MAX_COLLECTION_SIZE, List<List<Integer>>.class);
		Test.stopTest();
        System.assert(output!=null && output.size()==10);
    }
    
    @IsTest
    static void testDoPartition3() {
        //Negetive Test
        boolean failed = false;
		Test.startTest();
        try {
            PartitionService.doPartions(null, MAX_COLLECTION_SIZE, List<List<Integer>>.class);
        }
        catch(NullPointerException ex) {
            failed= true;
        }
		Test.stopTest();
        System.assert(failed==true);
    }
    
    @IsTest
    static void testDoPartition4() {
        //Negetive Test
        boolean failed = false;
        List<Integer> input = new List<Integer>();
		Test.startTest();
        try {
            PartitionService.doPartions(input, 0, List<List<Integer>>.class);
        }
        catch(PartitionService.IllegalArgumentException ex) {
            failed= true;
        }
		Test.stopTest();
        System.assert(failed==true);
    }
}