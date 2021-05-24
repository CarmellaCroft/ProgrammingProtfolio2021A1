 // Java program for the above approach
import java.util.Scanner;
 class Main {
    
   // number guessing game
   public static void
   guessingNumberGame()
   {
     
       Scanner sc = new Scanner(System.in);
        // Generate the numbers
       int number = 1 + (int)(100
                              * Math.random());
       int K = 5;
        int i, guess;
        System.out.println(
           "Hello, A number between 1 and 100 has been chosen!"
           + " It is yout job to guess it."
           + "You will have 5 tries!"
           + " Good Luck!!")
       for (i = 0; i < K; i++) {
            System.out.println(
               "Enter your guess:");
            // Take input for guessing
           guess = sc.nextInt();
            // If the number is guessed
           if (number == guess) {
               System.out.println(
                   "Congratulations!"
                   + " You guessed the number:)");
               break;
           }
           else if (number > guess
                    && i != K - 1) {
               System.out.println(
                   "The number is "
                   + "greater than " + guess);
           }
           else if (number < guess
                    && i != K - 1) {
               System.out.println(
                   "The number is"
                   + " less than " + guess);
           }
       }
        if (i == K) {
           System.out.println(
               "You have ussed up all your guesses"
               + " Sorry :(");
            System.out.println(
               "The number was " + number);
       }
   }
   public static void
   main(String arg[])
   {
       guessingNumberGame();
   }
}
