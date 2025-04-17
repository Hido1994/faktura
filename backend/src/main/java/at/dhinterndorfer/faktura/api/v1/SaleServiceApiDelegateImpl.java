package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.SaleServiceFilterRequestRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceRestDto;
import at.dhinterndorfer.faktura.sale.service.SaleServiceController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SaleServiceApiDelegateImpl implements SaleServiceApiDelegate {
    private final SaleServiceController saleServiceController;

    @Override
    public ResponseEntity<Void> deleteSaleService(Long id) {
        saleServiceController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<SaleServiceRestDto> getSaleServiceById(Long id) {
        return ResponseEntity.ok(saleServiceController.findById(id));
    }

    @Override
    public ResponseEntity<SaleServicePageRestDto> getSaleServices(
        SaleServiceFilterRequestRestDto saleServiceFilterRequestRestDto) {
        return ResponseEntity.ok(saleServiceController.findAll(saleServiceFilterRequestRestDto.getFilter(),
            saleServiceFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<SaleServiceRestDto> saveSaleService(SaleServiceRestDto saleServiceRestDto) {
        return ResponseEntity.ok(saleServiceController.save(saleServiceRestDto));
    }
}
