using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Math;

namespace FigureAreaCalculatingLib
{
    public class Triangle : Shape
    {
        public double[] Sides { get; private set; } = new double[3];// Использую массив, поскольку это позволит более удобно оперировать сторонами и не заботиться об их порядке ввода. Приватность сетера обусловлена этой самой сортировкой.

        public double Area { get; private set; } = 0;

        private double CalculatePerimeter()
        {
            double perimeter = 0;
            foreach (var side in Sides)
            {
                perimeter += side;
            }
            return perimeter;
        }

        public double CalculateArea()
        {
            double poluPerimeter = CalculatePerimeter() / 2;
            return Area = Math.Sqrt(poluPerimeter * (poluPerimeter - Sides[0]) * (poluPerimeter - Sides[1]) * (poluPerimeter - Sides[2]));//Массив уже отсортирован в конструкторе, поэтому обращаюсь напрямую по индексам.
        }

        public bool IsRightTreangle()
        {
            if (Sides.Contains(0))
            {
                return false;
            }
            return Pow(Sides[2], 2) == Pow(Sides[1], 2) + Pow(Sides[0], 2);
        }

        public Triangle(double a, double b, double c)
        {
            Sides[0] = Math.Abs(a);
            Sides[1] = Math.Abs(b);
            Sides[2] = Math.Abs(c);
            Array.Sort(Sides);
            if (Sides[2] > Sides[1] + Sides[0])//Это позволит избежать "падения" программы. Засчёт этого решения все расчёты просто будут равны 0, что уже нехарактерно для ЛЮБОЙ фигуры, кроме математической точки.
            {
                Sides[0] = 0;
                Sides[1] = 0;
                Sides[2] = 0;
            }
        }
    }
}
