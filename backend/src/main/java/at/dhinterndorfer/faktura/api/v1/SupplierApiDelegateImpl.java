package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.supplier.SupplierController;
import at.dhinterndorfer.faktura.dto.v1.SupplierPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SupplierRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.NativeWebRequest;

@RequiredArgsConstructor
@Service
public class SupplierApiDelegateImpl implements SupplierApiDelegate {
    private final SupplierController supplierController;
    private final NativeWebRequest nativeWebRequest;

    @Override
    public ResponseEntity<Void> deleteSupplier(Long id) {
        supplierController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<SupplierRestDto> getSupplierById(Long id) {
        return ResponseEntity.ok(supplierController.findById(id));
    }

    @Override
    public ResponseEntity<SupplierPageRestDto> getSuppliers(PageableRestDto pageable) {
        return ResponseEntity.ok(supplierController.findAll(pageable));
    }

    @Override
    public ResponseEntity<SupplierRestDto> saveSupplier(SupplierRestDto supplierRestDto) {
        return ResponseEntity.ok(supplierController.save(supplierRestDto));
    }
}
