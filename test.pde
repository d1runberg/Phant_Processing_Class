Phant read;
Phant write;
Phant del;

void setup()
{
  read= new Phant();  //reading unknown public feed
  write = new Phant();  //without delete feed option
   
  //for data.sparkfun.com "server" = "data.sparkfun.com"  
  
  read.startFeed("data.sparkfun.com", "q58gwmpVaOfm0jw1z7DX");
  write.startFeed("data.sparkfun.com","q58gwmpVaOfm0jw1z7DX","BVejmgn6G8fmWG9AkbKM");

  write.postRate(10);   //set post rate timing is seconds
  read.getRate(10);      //set get rate timing in seconds
}

void draw()
{
  //concatenate data to the URL string
  
  write.addField("temperature", 12);  //name, data(int, byte, char, string)
  write.addField("humidity", 2);
  write.addField("light",32);
  write.addField("pressure","HIGH");

  //write.post();    //post data to feed
  //write.clear();   //clear all previous data from the feed
  //write.delete(boolean);  // pass either true or false to delete() to DELETE the feed

  //stats functions
  //println("page Count: "+read.pageCount());  //pageCount() returns number of pages  
  //println("bytes Used: "+read.bytesUsed());  //bytesUsed() returns number of bytes used
  //println("bytes Remaining: "+read.bytesRemaining());  //bytesRemaining() returns number of bytes remaining
  //println("bytes Cap: "+ read.bytesCap());  //bytesCap returns feed cap size
  
}
void keyPressed()
{
  ////******* Filters functions to be restuctured to (field, filter character as string, value) and use switch case.
 
  //filters are:
  // lt- less than
  // gt- greater than
  //lte- less than or equal to, 
  //gte- greater than or equal to
  //et- equal to
  //ne- not equal to
 
  //////////////////////////////
  /////CSV get functions
  ///////////////////////////////
  
  //print(read.getCSV());  //getCSV() returns ***ALL*** feed data as a string array
  //print(read.getCSVFilter("lt","field1",98));  //getCSV() with a single filter getCSV(filter,field,value)
  //print(read.getCSVFilter("lt", "field1", 95, "gt", "field1", 60)); //application of 2 filters returned in CSV
  //print(read.getCSVLatest());  //returns latest post in String array format
  //print(read.getCSVLimit(5));  //returns  values with a limit of 5 posts
  
  /////////////////////////////
  //JSON get functions
  ///////////////////////////
  
  //print(read.getJSON());  //getJSON() returns ***ALL*** data as a JSONArray
  //print(read.getJSONFilter("et","light", 32));  //applies filter and returns as a JSONArray
  //print(read.getJSONLatest());  //returns latest post from feed as a JSON object
  //print(read.getJSONLimit(5));  //return data with a limit of 5 posts
}


