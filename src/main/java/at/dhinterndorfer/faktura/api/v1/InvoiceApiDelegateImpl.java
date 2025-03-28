package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.invoice.InvoiceController;
import at.dhinterndorfer.faktura.dto.v1.InvoicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoiceRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class InvoiceApiDelegateImpl implements InvoiceApiDelegate {
    private final InvoiceController invoiceController;

    @Override
    public ResponseEntity<Void> deleteInvoice(Long id) {
        invoiceController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<InvoiceRestDto> getInvoiceById(Long id) {
        return ResponseEntity.ok(invoiceController.findById(id));
    }

    @Override
    public ResponseEntity<InvoicePageRestDto> getInvoices(PageableRestDto pageable) {
        return ResponseEntity.ok(invoiceController.findAll(pageable));
    }

    @Override
    public ResponseEntity<InvoiceRestDto> saveInvoice(InvoiceRestDto invoiceRestDto) {
        return ResponseEntity.ok(invoiceController.save(invoiceRestDto));
    }
}
