using NUnit.Framework;
using FigureAreaCalculatingLib;

namespace Tests
{
    [TestFixture]
    public class Tests
    {
        [Test]
        [TestCase(3, 4, 5, 6)]
        [TestCase(-3, -4, -5, 6)]
        [TestCase(5, 4, 3, 6)]
        [TestCase(5, 4, 33, 0)]
        [TestCase(0, 0, 0, 0)]
        public void TriangleAreaCalculationTest(double a, double b, double c, double result)
        {
            Shape triangle = new Triangle(a, b, c);
            Assert.AreEqual(result, triangle.CalculateArea(), 0.000001);
        }
        [Test]
        [TestCase(0, 0)]
        [TestCase(5, 78.539816)]
        [TestCase(-5, 78.539816)]
        public void RoundAreaCalculationTest(double radius, double result)
        {
            Shape round = new Round(radius);
            Assert.AreEqual(result, round.CalculateArea(), 0.000001);
        }
        [Test]
        [TestCase(3,4,5,true)]
        [TestCase(4,7,4, false)]
        [TestCase(4,7,1, false)]
        [TestCase(0, 0, 0, false)]
        public void TrianglRightnessTest(double a, double b, double c, bool result)
        {
            Triangle triangle = new Triangle(a, b, c);
            Assert.AreEqual(result, triangle.IsRightTreangle());
        }
    }
}