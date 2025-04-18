return {
  -- Define a label
  label = "_start:",

  -- Print hello world in assembly
  hello_world = {
    "section .data",
    "    msg db 'Hello, World!', 0",
    "",
    "section .text",
    "    global _start",
    "_start:",
    "    ; write message",
    "    mov rax, 1          ; syscall number for sys_write",
    "    mov rdi, 1          ; file descriptor 1 (stdout)",
    "    mov rsi, msg        ; pointer to message",
    "    mov rdx, 13         ; length of message",
    "    syscall             ; make the syscall",
    "",
    "    ; exit program",
    "    mov rax, 60         ; syscall number for sys_exit",
    "    xor rdi, rdi        ; status code 0",
    "    syscall             ; make the syscall",
  },

  -- Function prologue
  func_prologue = {
    "push rbp",
    "mov rdi, rsi", -- copy argument to rdi (example)
    "call my_func",
    "pop rbp",
  },

  -- Exit program (Linux x86_64)
  exit_program = {
    "mov rax, 60    ; syscall number for sys_exit",
    "xor rdi, rdi   ; exit status 0",
    "syscall        ; call the kernel",
  },

  -- Print integer (example)
  print_int = {
    "mov rsi, rbx    ; integer to print",
    "mov rax, 1      ; syscall number for sys_write",
    "mov rdi, 1      ; file descriptor (stdout)",
    "mov rdx, 4      ; number of bytes to write",
    "syscall         ; make syscall",
  },

  -- Simple loop (decrement counter)
  simple_loop = {
    "mov rax, 10       ; initialize counter",
    "loop_start:",
    "    dec rax        ; decrement counter",
    "    jnz loop_start ; jump if not zero",
  },

  -- Stack push example (example function prologue)
  push_example = {
    "push rbx",
    "push rax",
  },

  -- Stack pop example (function epilogue)
  pop_example = {
    "pop rax",
    "pop rbx",
  },
}
