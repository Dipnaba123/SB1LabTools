ws <- websocket::WebSocket$new("ws://172.15.1.20:8080/")
tt

ws$onMessage(function(event) {
  cat("Client received message:", event$data, "\n")
  #print(event$data)
})

# Wait for a moment before running next line
ws$send("GTEX_Summary")

# Close client
ws$close()


ws$send(paste0("GTEX_Summary+",SNP,"+",Gene,"+",Tissue))

GTEX_Summary <- function(SNP,Gene,Tissue)
{
  ws$send(paste0("GTEX_Summary+",SNP,"+",Gene,"+",Tissue))
}

SNP = "chr3_49771630_G_T_b38" 
Gene ="ENSG00000182179.12" 
Tissue ="Whole_Blood"
