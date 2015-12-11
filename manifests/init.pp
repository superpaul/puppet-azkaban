class azkaban (
){
    #include azkaban::solo
    class { 'azkaban::solo': }
    notice("Here I am")

}
