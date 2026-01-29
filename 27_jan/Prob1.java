/*Problem-1
Create a program that:
Reads a paragraph from a file.
Performs the following:
Count total words, sentences, and characters (excluding spaces).
Find the top 5 most frequent words (case-insensitive).
Replace multiple spaces with a single space.
Reverse each sentence without changing word order.
Compare strings using both == and equals() and print results with explanation.
Must Use
✔ String class
✔ StringBuilder
✔ Common String methods (split, toLowerCase, trim, replace)
✔ equals() vs ==
✔ File reading
✔ Exception handling (try-catch) */
import java .io.*;
import java.util.*;
public class Prob1{
  public static void main(String args[]){
    File file=new File("input.txt");
    try{
      BufferedReader br=new BufferedReader(new FileReader(file));
      StringBuilder sb=new StringBuilder();
      String line;
      while((line=br.readLine())!=null){
        sb.append(line).append(" ");
      }
      br.close();
      String paragraph=sb.toString().trim();
      // Count characters excluding spaces
      int charCount=paragraph.replace(" ","").length();
      // Count words
      String[] words=paragraph.split("\\s+");
      int wordCount=words.length;
      // Count sentences
      String[] sentences=paragraph.split("[.!?]+");
      int sentenceCount=sentences.length;
      // Find top 5 frequent words
      Map<String,Integer> wordFreq=new HashMap<>();
      for(String word:words){
        word=word.toLowerCase().replaceAll("[^a-zA-Z]","");
        if(word.length()>0){
          wordFreq.put(word,wordFreq.getOrDefault(word,0)+1);
        }
      }
      List<Map.Entry<String,Integer>> freqList=new ArrayList<>(wordFreq.entrySet());
      freqList.sort((a,b)->b.getValue()-a.getValue());
      System.out.println("Total Characters (excluding spaces): "+charCount);
      System.out.println("Total Words: "+wordCount);
      System.out.println("Total Sentences: "+sentenceCount);
      System.out.println("Top 5 Frequent Words:");
      for(int i=0;i<Math.min(5,freqList.size());i++){
        System.out.println(freqList.get(i).getKey()+": "+freqList.get(i).getValue());
      }
      // Replace multiple spaces with single space
      String cleanedParagraph=paragraph.replaceAll("\\s+"," ");
      System.out.println(cleanedParagraph);
      // Reverse each sentence without changing word order
      StringBuilder reversedSentences=new StringBuilder();
      for(String sentence:sentences){
        String[] sentenceWords=sentence.trim().split("\\s+");
        StringBuilder reversedSentence=new StringBuilder();
        for(int i=sentenceWords.length-1;i>=0;i--){
          reversedSentence.append(sentenceWords[i]).append(" ");
        }
        reversedSentences.append(reversedSentence.toString().trim()).append(". ");
      }
      System.out.println("Reversed Sentences: "+reversedSentences.toString().trim());
      // String comparison
      String str1=new String("example");
      String str2=new String("example");
      if(str1==str2){
        System.out.println("Using '==': str1 and str2 reference the same object.");
      } else {
        System.out.println("Using '==': str1 and str2 reference different objects.");
      }
    }
    catch(IOException e){
      System.out.println("Error reading file: "+e.getMessage());
    } 
  }
}