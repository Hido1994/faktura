package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.customer.CustomerController;
import at.dhinterndorfer.faktura.dto.v1.CustomerPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.CustomerRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CustomerApiDelegateImpl implements CustomerApiDelegate {
    private final CustomerController customerController;

    @Override
    public ResponseEntity<Void> deleteCustomer(Long id) {
        customerController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<CustomerRestDto> getCustomerById(Long id) {
        return ResponseEntity.ok(customerController.findById(id));
    }

    @Override
    public ResponseEntity<CustomerPageRestDto> getCustomers(PageableRestDto pageable) {
        return ResponseEntity.ok(customerController.findAll(pageable));
    }

    @Override
    public ResponseEntity<CustomerRestDto> saveCustomer(CustomerRestDto customerRestDto) {
        return ResponseEntity.ok(customerController.save(customerRestDto));
    }
}
