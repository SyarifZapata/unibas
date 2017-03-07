public class List {
    Element root = null;
    Element heap = null;
    int size = 0;

    private class Element{
        Element next;
        int value;
    }

    public void addElement(int value){
        Element current;
        Element element = new Element();

        if (root == null) {
            root = new Element();
            root.value = value;
            heap = root;
            size++;
        }else{
            current = root;
            while (current.next != null){
                current = current.next;
            }
            current.next = element;
            element.value = value;
            heap = element;
            size++;
        }
    }

    public int getLastElement(){
        if (size == 0){
            return 0;
        }else {
            Element current;
            current = root;
            while (current.next != heap) {
                current = current.next;
            }
            heap = current;
            size--;
            return current.next.value;
        }
    }

    public int getFirstElement(){
        if (size == 0){
            return 0;
        }else {
            Element current;
            current = root;
            root = current.next;
            size--;
            return current.value;
        }
    }

    public int size(){
        return size;
    }

    public static void main(String[] args) {
        List list = new List();
        list.addElement(10);
        list.addElement(11);
        list.addElement(12);
        list.addElement(13);
        System.out.println(list.size());
        System.out.println(list.getLastElement());
        System.out.println(list.getFirstElement());
        System.out.println(list.size());
        System.out.println(list.getLastElement());
        System.out.println(list.getFirstElement());
        System.out.println(list.getLastElement());
    }
}