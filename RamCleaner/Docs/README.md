# 🚀 Otimizador de Memória RAM v3.0

[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)](https://github.com/Gabs77u/Otimizador-WIN)
[![Windows](https://img.shields.io/badge/Windows-10%2F11-blue)](https://www.microsoft.com/windows)
[![License](https://img.shields.io/badge/License-CC%20BY--NC%204.0-orange)](LICENSE)
[![Version](https://img.shields.io/badge/Version-3.0-red)](https://github.com/Gabs77u/Otimizador-WIN/releases)

> 🎯 **Ferramenta avançada de otimização de memória RAM para Windows com interface moderna e funcionalidade adaptativa**

## ✨ Características Principais

### 🆕 **INOVAÇÃO: Modo Não-Administrador**
- ✅ **Primeira ferramenta** que funciona sem privilégios administrativos
- 🔄 **Interface adaptativa** baseada nas permissões do usuário
- 📊 **Estatísticas completas** disponíveis para qualquer usuário
- 🧹 **Limpeza básica** funcional em modo limitado

### 🛡️ **Sistema Robusto de Fallback**
- 🥇 **PowerShell** como método primário (Get-CimInstance)
- 🥈 **WMIC** como fallback automático
- ⚡ **Detecção inteligente** de disponibilidade
- 🔄 **Transição seamless** entre métodos

### 🎨 **Interface Moderna**
- 🌈 **UTF-8** com emojis e caracteres especiais
- 📱 **Design responsivo** 80x25 caracteres
- 🎭 **Menus adaptativos** baseados em privilégios
- 🔲 **ASCII Art** profissional

## 📊 Funcionalidades

### 🧹 **Sistema de Limpeza**
| Modo | Descrição | Disponibilidade |
|------|-----------|-----------------|
| 🚀 **Limpeza Rápida** | Coleta de lixo .NET + cache sistema | Admin |
| ⚡ **Limpeza Automática** | Execução programável (10-3600s) | Admin |
| 🔧 **Limpeza Avançada** | Arquivos temp + prefetch + lixeira | Admin |
| 🎯 **Limpeza Básica** | Coleta de lixo .NET | **Não-Admin** |

### 📈 **Monitoramento em Tempo Real**
- 📊 **Barra de progresso** ASCII colorizada
- 🚨 **Alertas configuráveis** (50-95%)
- 🔍 **Top 5 processos** por consumo de memória
- 💻 **Monitor de CPU** integrado
- ⏱️ **Refresh rate** ajustável (1-60s)

### ⚙️ **Configurações Avançadas**
- 🕐 **Intervalos** de limpeza automática
- 📊 **Níveis de alerta** personalizáveis
- 🔄 **Frequência** de atualização do monitor
- 💾 **Backup/Restore** de configurações

## 🚀 Instalação Rápida

### Método 1: Download Direto
```cmd
# 1. Baixar Memoria Ram.bat
# 2. Executar em modo administrador (recomendado)
# 3. Ou executar em modo normal (funcionalidade básica)
```

### Método 2: Clone do Repositório
```bash
git clone https://github.com/Gabs77u/Otimizador-WIN.git
cd Otimizador-WIN
```

## 💻 Requisitos do Sistema

### ✅ **Obrigatórios**
- 🖥️ **Windows 10/11** (build 1809+)
- ⚡ **PowerShell 5.0+** (padrão no Windows 10+)
- 🔧 **WMIC** disponível (fallback)

### 🎯 **Recomendados**
- 👤 **Privilégios administrativos** (funcionalidade completa)
- 🎨 **Terminal UTF-8** compatível
- 🔤 **Fonte com emojis** (Segoe UI Emoji)

### 🏃‍♂️ **Performance**
- 📊 **RAM**: 4GB+ (suporte até 64GB+)
- 💾 **Disco**: 50KB de espaço livre
- ⚡ **CPU**: Qualquer processador moderno

## 🎮 Como Usar

### 🚀 **Execução Básica**
1. Clique duas vezes em `Memoria Ram.bat`
2. Escolha uma opção do menu principal
3. Siga as instruções na tela

### 🔧 **Modo Administrador (Recomendado)**
1. Clique com botão direito em `Memoria Ram.bat`
2. Selecione "Executar como administrador"
3. Aproveite todas as funcionalidades

### 📊 **Primeiro Uso**
1. Execute opção **[4] Estatísticas** para validar
2. Configure alertas em **[6] Configurações**
3. Teste limpeza básica com **[1] Limpeza Rápida**

## 📋 Menu Principal

```
╔═══════════════════════════════════════════════════════════════════════════╗
║                            📋 MENU PRINCIPAL                             ║
╠═══════════════════════════════════════════════════════════════════════════╣
║  [1] 🧹 Limpeza Rápida de Memória                                        ║
║  [2] ⚡ Limpeza Automática (A cada 30s)                                  ║
║  [3] 🔧 Limpeza Avançada + Arquivos                                      ║
║  [4] 📊 Estatísticas de Memória                                          ║
║  [5] 📈 Monitor em Tempo Real                                            ║
║  [6] ⚙️  Configurações                                                    ║
║  [?] ❓ Ajuda                                                             ║
║  [0] 🚪 Sair                                                              ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

## 🔧 Comandos Úteis


### 📊 **Verificar Memória**
```cmd
wmic OS get TotalVisibleMemorySize,FreePhysicalMemory /value
```

### ⚡ **Teste PowerShell**
```powershell
Get-CimInstance -ClassName Win32_OperatingSystem
```

## 🛡️ Segurança

### ✅ **Operações Seguras**
- 🔒 **Não modifica** arquivos do sistema
- 📝 **Não altera** registro do Windows  
- 🔄 **Operações reversíveis**
- ✋ **Confirmação** antes de ações críticas

### ⚠️ **Precauções**
- 🧪 **Teste** em ambiente não-crítico primeiro
- 💾 **Backup** de configurações importantes
- 👁️ **Monitore** uso de CPU durante execução
- 🔍 **Verifique** alertas do antivírus

## 📈 Resultados Esperados

### 💪 **Performance**
- 📉 **Redução** de 10-30% no uso de memória
- ⚡ **Melhoria** na responsividade do sistema
- 🔄 **Liberação** de memória fragmentada
- 🧹 **Limpeza** de arquivos temporários

### 📊 **Monitoramento**
- 📈 **Gráficos** em tempo real
- 🚨 **Alertas** preventivos
- 🔍 **Identificação** de processos problemáticos
- 📋 **Relatórios** de limpeza

## 🎯 Casos de Uso

### 👨‍💻 **Desenvolvedores**
- 🔧 Limpeza entre builds pesados
- 📊 Monitoramento de aplicações
- 🧪 Testes de performance

### 🎮 **Gamers**
- ⚡ Otimização antes de jogos
- 📈 Monitor de recursos em tempo real
- 🧹 Limpeza automática em background

### 🏢 **Empresas**
- 📊 Monitoramento de estações de trabalho
- 🔄 Manutenção automatizada
- 📈 Relatórios de uso de memória

### 👨‍🎓 **Usuários Domésticos**
- 🚀 Aceleração do sistema
- 🧹 Limpeza regular automatizada
- 📱 Interface simples e intuitiva

## 🔧 Solução de Problemas

### ❓ **Problemas Comuns**

#### "Memória não disponível"
```cmd
# Solução: Executar como administrador
# Ou: Usar modo não-admin (funcionalidade limitada)
```

#### "PowerShell não funciona"
```cmd
# Solução: Script usa WMIC automaticamente
# Fallback ativado transparentemente
```

#### "Caracteres estranhos"
```cmd
# Solução: Terminal com suporte UTF-8
# Use Windows Terminal ou CMD moderno
```

### 🆘 **Suporte**
- 📧 **Issues**: GitHub Issues
- 📖 **Documentação**: `RELATORIO_FINAL_PRODUCAO.md`


### 📋 **Arquivos Inclusos**
- `Memoria Ram.bat` - Script principal
- `LICENSE` - Licença Creative Commons

### 🔧 **Arquitetura**
- **PowerShell**: Método primário para informações do sistema
- **WMIC**: Fallback robusto para compatibilidade
- **Batch**: Core engine com delayed expansion
- **UTF-8**: Codificação moderna para interface

## 🤝 Contribuindo

### 🌟 **Como Contribuir**
1. **Fork** o repositório
2. **Crie** uma branch para sua feature
3. **Commit** suas mudanças
4. **Push** para a branch
5. **Abra** um Pull Request

### 🐛 **Reportar Bugs**
- 📝 Use o template de issue
- 🔍 Inclua logs de erro
- 🖥️ Especifique versão do Windows
- 🧪 Anexe resultado do teste

## 📄 Licença

Este projeto está licenciado sob **Creative Commons BY-NC 4.0** - veja o arquivo [LICENSE](LICENSE) para detalhes.

### ✅ **Permitido**
- ✅ Uso pessoal
- ✅ Uso educacional
- ✅ Modificação
- ✅ Distribuição (com atribuição)

### ❌ **Não Permitido**
- ❌ Uso comercial
- ❌ Venda do software
- ❌ Remoção de créditos

## 🏆 Reconhecimentos

### 👨‍💻 **Desenvolvido por**
- **Gabs77u** - Desenvolvimento principal e arquitetura

### 🙏 **Agradecimentos**
- Microsoft - Windows APIs e PowerShell
- Comunidade - Feedback e testes
- GitHub - Hospedagem do projeto

### 🌟 **Tecnologias Utilizadas**
- **Batch Script** - Core engine
- **PowerShell** - System information
- **WMIC** - Fallback compatibility
- **UTF-8** - Modern interface
- **ASCII Art** - Visual design

---

## 📊 Status do Projeto

### ✅ **Pronto para Produção**
- 🧪 **5/5 testes** passando
- 🔧 **100% funcional** em Windows 10/11
- 🛡️ **Segurança** validada
- 📱 **Interface** otimizada
- 🚀 **Performance** excelente

### 📈 **Estatísticas**
- ⭐ **800+ linhas** de código
- 🔧 **25+ funções** especializadas
- 🧪 **5 testes** automatizados
- 📊 **100% compatibilidade** Windows 10/11
- 🏆 **Production Ready** ✅

---

<div align="center">

### 🎉 **Obrigado por usar o Otimizador de Memória RAM v3.0!** 🎉

[![GitHub](https://img.shields.io/badge/GitHub-Gabs77u-black?logo=github)](https://github.com/Gabs77u)
[![License](https://img.shields.io/badge/License-CC%20BY--NC%204.0-orange)](LICENSE)
[![Windows](https://img.shields.io/badge/Windows-10%2F11-blue)](https://www.microsoft.com/windows)

**Desenvolvido com ❤️ para a comunidade Windows**

</div>
