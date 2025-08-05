package j0805;

import java.util.Scanner;

public class Test02_1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("숫자를 입력해주세요.");
		System.out.print("입력> ");
		int su = scanner.nextInt();
		
		String str = "";
		if(su%2 == 0) str = "짝수";
		else str = "홀수";
		
		System.out.println("입력하신 "+su+"는 "+str+"입니다.");
		
		scanner.close();
	}
}
