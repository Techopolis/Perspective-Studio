import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @Binding var selectedTab: SidebarTab
    let chatViewModel: ChatViewModel

    var body: some View {
        if hasCompletedOnboarding {
            MainView(selectedTab: $selectedTab, chatViewModel: chatViewModel)
        } else {
            OnboardingContainerView {
                hasCompletedOnboarding = true
            }
        }
    }
}

// MARK: - Main View

enum SidebarTab: String, CaseIterable, Identifiable {
    case discover
    case chat
    case downloads
    case settings

    var id: String { rawValue }

    var title: String {
        switch self {
        case .discover: "Discover"
        case .chat: "Chat"
        case .downloads: "Downloads"
        case .settings: "Settings"
        }
    }

    var symbol: String {
        switch self {
        case .discover: "sparkle.magnifyingglass"
        case .chat: "bubble.left.and.bubble.right"
        case .downloads: "arrow.down.circle"
        case .settings: "gearshape"
        }
    }

    var shortcutNumber: Int {
        switch self {
        case .discover: 1
        case .chat: 2
        case .downloads: 3
        case .settings: 4
        }
    }

    var keyEquivalent: KeyEquivalent {
        switch self {
        case .discover: "1"
        case .chat: "2"
        case .downloads: "3"
        case .settings: "4"
        }
    }
}

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var selectedTab: SidebarTab
    @Bindable var chatViewModel: ChatViewModel

    var body: some View {
        NavigationSplitView {
            VStack(spacing: 0) {
                List(selection: $selectedTab) {
                    ForEach(SidebarTab.allCases) { tab in
                        Label(tab.title, systemImage: tab.symbol)
                            .tag(tab)
                    }
                }
                .listStyle(.sidebar)

                if selectedTab == .chat {
                    Divider()
                    ConversationListView(
                        selectedConversation: $chatViewModel.selectedConversation,
                        onNewChat: { chatViewModel.createConversation(in: modelContext) },
                        onDelete: { chatViewModel.deleteConversation($0, in: modelContext) }
                    )
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 240, max: 300)
        } detail: {
            switch selectedTab {
            case .chat:
                if let conversation = chatViewModel.selectedConversation {
                    ChatDetailView(conversation: conversation, chatViewModel: chatViewModel)
                } else {
                    ContentUnavailableView("Select a Conversation", systemImage: "bubble.left")
                }
            case .discover:
                NavigationStack {
                    ModelDiscoveryView(models: chatViewModel.availableModels, chatViewModel: chatViewModel)
                }
            case .downloads:
                DownloadsView(chatViewModel: chatViewModel)
            case .settings:
                SettingsView()
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onChange(of: selectedTab) { _, newTab in
            // When switching to Chat via keyboard shortcut with no conversation, create one
            if newTab == .chat && chatViewModel.selectedConversation == nil {
                chatViewModel.createConversation(in: modelContext)
            }
        }
        .onChange(of: chatViewModel.selectedConversation) {
            Task { await LLMService.shared.resetSession() }
        }
        .task {
            await chatViewModel.fetchModels()
        }
    }
}
