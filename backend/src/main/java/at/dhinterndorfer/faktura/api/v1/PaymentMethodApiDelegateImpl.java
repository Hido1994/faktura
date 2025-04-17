package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.*;
import at.dhinterndorfer.faktura.paymentmethod.PaymentMethodController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PaymentMethodApiDelegateImpl implements PaymentMethodApiDelegate {
    private final PaymentMethodController paymentMethodController;

    @Override
    public ResponseEntity<Void> deletePaymentMethod(Long id) {
        paymentMethodController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<PaymentMethodRestDto> getPaymentMethodById(Long id) {
        return ResponseEntity.ok(paymentMethodController.findById(id));
    }
    
    @Override
    public ResponseEntity<PaymentMethodPageRestDto> getPaymentMethods(PaymentMethodFilterRequestRestDto paymentMethodFilterRequestRestDto) {
        return ResponseEntity.ok(paymentMethodController.findAll(paymentMethodFilterRequestRestDto.getFilter(),
            paymentMethodFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<PaymentMethodRestDto> savePaymentMethod(PaymentMethodRestDto paymentMethodRestDto) {
        return ResponseEntity.ok(paymentMethodController.save(paymentMethodRestDto));
    }
}
