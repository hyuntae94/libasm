* 어셈블리어란?(.s)
- 기계어와 일대일대응이 되는 컴퓨터 프로그래밍의 저급 언어
- 실제 컴퓨터 프로그램은 0과 1로 구성되는데, 이를 기계어라고 한다.
- 어셈블리어는 이러한 기계어에 MOV,ADD와 같은 명령어를 각각 대응시킨 언어.
- main.c ---(전처리기)---> main.i ---(컴파일러)---> main.s ---(어셈블러)--->main.o ---(링커)--->main(실행파일)

* 어셈블러 종류에 따라 채택 가능한 문법이 다르다.
- GAS(GNU Assembler) - AT&T 문법
- NASM(Netwide Assembler) - Intel 문법
- MASM(Microsoft Macro Assembler) - Intel 문법(NASM과 완전히 같지는 않지만 거의 비슷)등..
- 이외에도 어셈블러는 TASM, YASM 등 여러 종류가 있다

* 프로그램 구조
- section.text : 실행할 코드를 작성하는 공간

* 문법
- Opcode(명령어) Operand1(Destination 인자), Operand2(source인자)

* Opcode
1. 조작명령어
- call : 함수 호출
- ret : call로 호출된 함수를 종료하고 그다음 명령줄로 이동
- nop : 아무것도 하지 않음
- jmp : 분기(라벨)(반복문) 실행.
- je : cmp A B 에서 A=B일때 특정라벨로 jmp
- jne : A != B 일때 jmp
- ja : A > B 일때
- jb : A < B
- jae : A >= B
- jbe : A <= B
2. 데이터 전송 명령어
- push :스택에 값을 넣음
- pop: 스택에서 값을 가져옴
- mov : 인자2값을 인자1에 대입(전달)
- lea : 인자2주소를 인자1에 대입(전달)
3. 산술명령어
- inc: 인자의 값을 1증가
- dec: 인자의 값을 1감소
- add: 인자2값을 인자1에 더함
- sub: 인자2값을 인자1에서 뺌
- cmp: 인자 1,2값 비교
- test: 인자1,2 AND연산. 이 연산의 결과는 ZF(zero flag)에만 영향을 미치고 Operand자체에는 영향을 미치지 않는다.

* Syscall
_main:
    mov rax, 0x2000004 ;시스템콜 함수를 write로 변경
    syscall ;시스템콜(write) 호출
- 이 때 syscall 할 함수의 번호를 rax에 미리 넣어줘야한다.
- syscall 함수의 반환값 또한 rax에 저장된다.

* 자주 사용하는 syscall numbers (mac)
0x2000001 - exit()
0x2000002 -
0x2000003 - read()
0x2000004 - write()
0x2000005 - open()
0x2000006 - close()

* 어셈블리 변수
data type (자료형)			크기
BYTE					부호 없는 1 byte
WORD					부호 없는 2 byte
DWORD					부호 없는 4 byte
QWORD					부호 없는 8 byte


* 범용 레지스터
- RAX (Accumulator) : 더하기, 빼기 등 산술/논리 연산을 수행하며 함수의 return값이 저장된다.
                      시스템콜 함수를 사용하려면 RAX에 함수의 syscall 번호를 넣어준다.
- RBX (Base) : 메모리 주소를 저장하기 위한 용도로 사용된다.
- RCX (Count) : 반복문에서 카운터로 사용되는 레지스터. 고급언어 for문의 i 와 같은 역할이지만, 다만 ECX는 미리 반복 값을 정해두고
                명령어를 사용할 때마다 값이 하나씩 줄어든다는 점이 다르다.
                syscall을 호출했던 사용자프로그램의 return 주소를 가진다.
- RDX (Data) : 다른 레지스터를 서포트하는 여분의 레지스터. 큰 수의 곱셈이나 나눗셈 연산에서 EAX와 함께 사용된다.

* 인덱스 레지스터
- RSI (Source Index) : 데이터를 복사할 때 src데이터, 즉 복사할 데이터의 주소가 저장된다.
- RDI (Destination Index) : 데이터를 복사할 때 복사된 dest데이터의 주소가 저장된다.

* 데이터 레지스터
(64bit - 32bit - 16bit - up 8bit - down 8bit)
rax - eax - ax - ah - al (Accumulator 기본 누산기)
rbx - ebx - bx - bh - bl (Base 인덱싱된 주소 지정에 사용 가능해서 기본 레지스터라고 함)
rcx - ecx - cx - ch - cl (Count 루프카운트를 저장)
rdx - edx - dx - dh - dl (Data 입출력 작업에 사용/큰 값을 포함하는 곱셈 나눗셈 연산을 위해 DX,AX와 함께 사용)


에러넘버처리:https://velog.io/@jehjong/Assembly-Language-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%BD%9C-%EC%97%90%EB%9F%AC%EC%B2%98%EB%A6%AC
