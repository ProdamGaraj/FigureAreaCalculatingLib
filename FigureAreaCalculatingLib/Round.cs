using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Math;

namespace FigureAreaCalculatingLib
{
    public class Round:Shape
    {
        public double Radius { get; set; }

        public double Area { get; private set; }

        public double CalculateArea()
        {
            return Area = PI * Pow(Radius,2);
            
        }

        public Round(double radius)
        {
            Radius = radius; //Если радиус равен нулю, то это математическая точка с 0 площадью, библиотека это и выдаст.
        }
    }
}
