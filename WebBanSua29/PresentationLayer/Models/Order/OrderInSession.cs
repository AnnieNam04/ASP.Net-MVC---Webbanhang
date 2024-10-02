namespace PresentationLayer.Models.Order
{
    public class OrderInSession
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
        public string Image { get; set; }
        public int Prices { get; set; }
        public int SumCount { get; set; }

        public int Count { get; set; }
    }
}
