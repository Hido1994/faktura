package at.dhinterndorfer.faktura.customer;

import at.dhinterndorfer.faktura.customer.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
}