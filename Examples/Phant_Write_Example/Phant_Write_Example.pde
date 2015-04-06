Phant write;

void setup()
{
  
  write = new Phant();  //without delete feed option
   
  //startFeed(server, public key, private key); 
  write.startFeed("data.sparkfun.com","q58gwmpVaOfm0jw1z7DX","BVejmgn6G8fmWG9AkbKM");
  //set post rate in seconds
  write.postRate(15);   //set post rate timing is seconds
}

void draw()
{
  //concatenate data to the URL string////////////////////////////////
  //addField(name, data(int, byte, char, string))
  //change data values to changing variables
  
  write.addField("temperature", 12);  
  write.addField("humidity", 2);
  write.addField("light",32);
  write.addField("pressure","HIGH");

  write.post();    //post data to feed
  //write.clear();   //clear all previous data from the feed
  //write.delete(boolean);  // pass either true or false to delete() to DELETE the feed

  //statistics functions
  //println("page Count: "+read.pageCount());  //pageCount() returns number of pages  
  //println("bytes Used: "+read.bytesUsed());  //bytesUsed() returns number of bytes used
  //println("bytes Remaining: "+read.bytesRemaining());  //bytesRemaining() returns number of bytes remaining
  //println("bytes Cap: "+ read.bytesCap());  //bytesCap returns feed cap size
  
}

