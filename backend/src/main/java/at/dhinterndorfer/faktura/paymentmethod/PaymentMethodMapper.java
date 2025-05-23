package at.dhinterndorfer.faktura.paymentmethod;

import at.dhinterndorfer.faktura.dto.v1.PaymentMethodPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.PaymentMethodRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface PaymentMethodMapper {

    PaymentMethodRestDto mapToDto(PaymentMethod entity);

    List<PaymentMethodRestDto> mapToDto(List<PaymentMethod> entityList);

    PaymentMethod mapToDbo(PaymentMethodRestDto entity);

    List<PaymentMethod> mapToDbo(List<PaymentMethodRestDto> entityList);

    default PaymentMethodPageRestDto mapPage(Page<PaymentMethod> page) {
        PaymentMethodPageRestDto pageRestDto = new PaymentMethodPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}