using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Calculator
{
    public class Evaluator
    {
        public static double Evaluate(string s)
        {
            char[] arr = s.Replace(" ", "").ToCharArray();
            Stack<double> numbers = new Stack<double>();
            Stack<char> ops = new Stack<char>();
            bool lastIsNum = false, neg = false;
            for (int i = 0; i < arr.Length; i++)
            {
                if (IsNumber(arr[i]))
                {
                    if (lastIsNum)
                        ops.Push('*');
                    int num = arr[i] - '0';
                    while (i + 1 < arr.Length && IsNumber(arr[i + 1]))
                        num = num * 10 + arr[++i] - '0';
                    numbers.Push(neg ? -num : num);
                    neg = false;
                }
                else if (arr[i] == ')')
                {
                    while (ops.Peek() != '(')
                        Calc(numbers, ops);
                    ops.Pop();
                }
                else
                {
                    if (!lastIsNum && (arr[i] == '-' || arr[i] == '+'))
                    {
                        if (arr[i] == '-')
                            neg = !neg;
                    }
                    else
                    {
                        if (arr[i] != '(')
                            while (ops.Count > 0 && ops.Peek() != '(' && GetPriority(ops.Peek()) >= GetPriority(arr[i]))
                                Calc(numbers, ops);
                        else if (lastIsNum) // && arr[i] == '('
                            ops.Push('*');
                        ops.Push(arr[i]);
                    }
                }
                lastIsNum = IsNumber(arr[i]) || arr[i] == ')';
            }
            while (ops.Count > 0)
                Calc(numbers, ops);
            return numbers.Pop();
        }
        private static void Calc(Stack<double> values, Stack<char> ops)
        {
            double b = values.Pop();
            values.Push(Calculate(values.Pop(), b, ops.Pop()));
        }
        private static bool IsNumber(char c)
        {
            return c >= '0' && c <= '9';
        }
        private static int GetPriority(char op)
        {
            switch (op)
            {
                case '*':
                case '/': return 1;
                case '+':
                case '-': return 0;
            }
            throw new Exception(op + " is not an operator!");
        }

        private static double Calculate(double a, double b, char op)
        {
            switch (op)
            {
                case '*': return a * b;
                case '/': return a / b;
                case '+': return a + b;
                case '-': return a - b;
            }
            throw new Exception(op + " is not an operator!");
        }
    }
}