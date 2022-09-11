using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FigureAreaCalculatingLib
{
    public interface Shape
    {
        double Area { get; }
        double CalculateArea();
    }
}
