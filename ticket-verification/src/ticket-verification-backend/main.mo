import Principal "mo:base/Principal";
import Array "mo:base/Array";
// Event Ticketing System

actor TicketingSystem {
  type Ticket = {
    eventId: Text;
    ticketId: Text;
    owner: Principal;
  };

  stable var tickets: [Ticket] = [];

    public shared ({caller})  func issueTicket(eventId: Text, ticketId: Text) : async Bool {
    let owner = caller;
    let newArr: [Ticket] = [{ eventId = eventId; ticketId = ticketId; owner = owner }];
    tickets := Array.append<Ticket>(tickets, newArr);
    return true;
  };

  public query func verifyTicket(ticketId: Text) : async ?Ticket {
    return Array.find<Ticket>(tickets, func (t) { t.ticketId == ticketId });
  };

  public query func getTickets() : async [Ticket] {
    return tickets;
  };
};

