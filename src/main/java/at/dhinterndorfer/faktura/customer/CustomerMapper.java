package at.dhinterndorfer.faktura.customer;

import at.dhinterndorfer.faktura.customer.Customer;
import at.dhinterndorfer.faktura.dto.v1.CustomerPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.CustomerRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface CustomerMapper {

    CustomerRestDto mapToDto(Customer entity);

    List<CustomerRestDto> mapToDto(List<Customer> entityList);

    Customer mapToDbo(CustomerRestDto entity);

    List<Customer> mapToDbo(List<CustomerRestDto> entityList);

    default CustomerPageRestDto mapPage(Page<Customer> page) {
        CustomerPageRestDto pageRestDto = new CustomerPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}