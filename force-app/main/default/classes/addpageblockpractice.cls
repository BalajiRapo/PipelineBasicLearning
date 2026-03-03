public class addpageblockpractice {
    public List<String> lstSections { get; set; }

    public addpageblockpractice(){
        lstSections = new List<String>();
    }

    public PageReference addSection() {

        lstSections.add('dummy');

        return null;
    }

}