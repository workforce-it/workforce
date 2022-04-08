module BookingHelper
  def booking_heading(type)
    if type == :integration
      "Let's talk integrations"
    elsif type == :demo
      "Book a 30 min demo"
    else 
      "Book a 5 minute call"
    end
  end
  def booking_text(type)
    if type == :integration
      "Book a call, and we'll talk you through our integrations and how best-of-breed scheduling and attendance can work for your business."
    elsif type == :demo
      "We'll give you a walkthrough of our software, and talk about how you currently manage scheduling & attendance."
    else 
      "We'll run you through our software, and talk about how you currently manage scheduling & attendance."
    end
  end
end

