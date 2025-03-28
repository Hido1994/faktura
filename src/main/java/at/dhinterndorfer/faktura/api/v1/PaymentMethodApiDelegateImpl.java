package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.PaymentMethodPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.PaymentMethodRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
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
    public ResponseEntity<PaymentMethodPageRestDto> getPaymentMethods(PageableRestDto pageable) {
        return ResponseEntity.ok(paymentMethodController.findAll(pageable));
    }

    @Override
    public ResponseEntity<PaymentMethodRestDto> savePaymentMethod(PaymentMethodRestDto paymentMethodRestDto) {
        return ResponseEntity.ok(paymentMethodController.save(paymentMethodRestDto));
    }
}
